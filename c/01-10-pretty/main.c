#define CHARACTER_SIZE      16  //     ; 8 x 8 and 2 bits per pixel (16 bytes).
#define LCD_BUSY           0b00000010 //; LCD controller is busy, CPU has no access.
#define LCD_DEFAULT_PALETTE 0b11100100 //; Default grayscale palette.


__sfr __at (0x41) LCD_STATUS;       // Holds the current LCD controller status.
__sfr __at (0x42) LCD_SCROLL_Y;     // Vertical scroll position for background.
__sfr __at (0x43) LCD_SCROLL_X;     // Vertical scroll position for background.
__sfr __at (0x44) LCD_Y_COORDINATE; // Current line being sent to LCD controller.
__sfr __at (0x47) LCD_BG_PALETTE;   // Palette data for background.

/*
CHARACTER_DATA      EQU $8000     ; Area for 8 x 8 characters (tiles).
BG_DISPLAY_DATA     EQU $9800     ; Area for background display data (tilemap).

SOUND_CONTROL       EQU $FF26     ; Sound circuits status and control.

*/


unsigned char cursor_position;
unsigned char countdown_to_scroll;
unsigned char seed;

void init();
unsigned char random_number();
void print();
void fill_vram();
void wait_for_v_blank();
void set_cursor();

void main() {

    init();

    while (1) {
        offset = random_number() & 1;
        offset += 1;

        print();
    }
}

void init() {
    ;
}

unsigned char random_number() {
    /*
  ld a, [seed]
  sla a
  jp nc, .no_error
  xor a, $1d
.no_error:
  ld [seed], a

  ret   ;
  */
}

void print() {
    fill_vram();
    LCD_SCROLL_Y += 16;
    wait_for_v_blank();
    set_cursor();
}

void fill_vram() {
    ;
    /*
fill_vram:
.wait_for_vram:
  ld a, [LCD_STATUS]
  and LCD_BUSY
  jr nz, .wait_for_vram

  ld [de], a
  ld h, d
  ld l, e
  inc de
  dec bc
  */
}

void wait_for_v_blank() {
    while (LCD_Y_COORDINATE != 144) {};
}

void set_cursor() {
    ;
    /*
  set_cursor:
  push af
  push hl

  ld a, $14                       ; We are gooing to loop from $14 to $F4...
.check_for_screen_edge:           ; ...checking if cursor is on screen edge...
  cp a, e
  jr z, .move_cursor_to_next_line ; ...and in that case move it to next line.
  cp a, $F4
  jr z, .save_position            ; End the loop if finished...
  add a, $20                      ; ...else increment...
  jp .check_for_screen_edge       ; ...and loop.

.move_cursor_to_next_line:
  add a, $B
  ld e, a
  inc de

.check_for_reset:
  ld a, $9C
  cp a, d
  jp nz, .save_position
  ld a, $00
  cp a, e
  jp nz, .save_position
  ld de, BG_DISPLAY_DATA

.save_position:
  ld hl, cursor_position

  ld [hl], e
  inc hl
  ld [hl], d

.end:
  pop hl
  pop af

  ret
  */
}

