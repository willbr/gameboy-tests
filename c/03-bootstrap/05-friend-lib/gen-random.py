import random
import numpy as np

random.seed(26)

random_numbers = random.sample(range(256), 256)

random_table = np.array_split(random_numbers, 32)

print("const unsigned char random_table[] = {")

print(',\n'.join(', '.join(
    f'0x{x:02X}' for x in row)
        for row in random_table))

print("};")

