import unittest
from SeedGenerator import check_logic



class TestGeneration(unittest.TestCase):

    def test_Check_Logic(self):
		items = list(range(1, 361))
		# Check 99,999 times
		for i in xrange(99999):
			check_logic(items)
			# Checks if Lungfish Call is in AS
			# Checks if Gloria's Trophy, Straight Jacket, and Lobato Painting are in Upper Floors of AS
			self.assertFalse(169 <= items.index(1) <= 221)
			self.assertFalse(188 <= items.index(2) <= 221)
			self.assertFalse(188 <= items.index(3) <= 221)
			self.assertFalse(188 <= items.index(4) <= 221)
			# Checks if Clairvoyance is unobtainable.
			# Avoiding Clairvoyance being locked in MM and ASUP with one disguise/lungfishcall item also being in those locations
			self.assertFalse(222 <= items.index(33) <= 245 and 222 <= items.index(34) <= 245 
			and (222 <= items.index(1) <= 245 or 222 <= items.index(2) <= 245 or 222 <= items.index(3) <= 245 or 222 <= items.index(4) <= 245))
			self.assertFalse((222 <= items.index(33) <= 245 and 188 <= items.index(34) <= 221 or 222 <= items.index(34) <= 245 and 188 <= items.index(33) <= 221) 
			and (222 <= items.index(1) <= 245 or 222 <= items.index(2) <= 245 or 222 <= items.index(3) <= 245 or 222 <= items.index(4) <= 245))

if __name__ == '__main__':
	unittest.main()