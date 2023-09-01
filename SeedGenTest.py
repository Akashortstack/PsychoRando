import unittest
import random
from SeedGenerator import check_logic



class TestGeneration(unittest.TestCase):

    def test_Check_Logic(self):
		items = list(range(1, 356))
		random.shuffle(items)
		# Check 50,0000 times
		for i in xrange(50000):
			check_logic(items)
			self.assertFalse(169 <= items.index(1) <= 221)
			self.assertFalse(188 <= items.index(2) <= 221)
			self.assertFalse(188 <= items.index(3) <= 221)
			self.assertFalse(188 <= items.index(4) <= 221)
			pass

if __name__ == '__main__':
    unittest.main()