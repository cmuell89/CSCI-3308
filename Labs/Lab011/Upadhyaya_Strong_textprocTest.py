#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Satish Upadhyaya, Matthew Strong
# CSCI 3308 Section 205

# errors:


# test_init() - works and has correct handler when wrong type is the input.


# test_count - no for the lenght of the text string.

# test_count_alpha - there are no checks for uppercase alpha characters, added that into the regex check

# test_count_numeric - ignores parts of strings with a '0', added to the regex to solve the problem.

# test_count_vowels - does not account for i's or I's in strings of text, solution,  to solve, add 'i' in regex checks.

# test_is_phonenumber - is too inflexible, and will also disregard parentheses with any phone number here, solution was to format the string over
# again for the best possible results.

import unittest
import textproc

class TextprocTestCase(unittest.TestCase):

    @classmethod
    def setUpClass(cls):

        pass

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_init(self):
        text = "tesing123"
        p = textproc.Processor(text)
        self.assertEqual(p.text, text, "'text' does not match input")

        # showing the case of an error
        e = 2.7
        p = textproc.Processor(e)
        # testing for error here
        self.assertEqual(type(e), str)

    def test_count(self):
        cases = ["harden", "matthew!E$#$#money!", "testcase1"]
        for c in cases:
            x = textproc.Processor(c)
            self.assertEqual(x.count(), len(c))
            # works perfectly

    def test_count_alpha(self):
        cases = ["Kobe Bryant", "Matthew Strong", "LeBron James", "running", "the chalice", "giannis a."]
        for c in cases:
            x = textproc.Processor(c)
            l = 0
            for ch in c:
                if ch.isalpha():
                    l+=1

            self.assertEqual(x.count_alpha(), l)
    

    def test_count_numeric(self):
        cases = ["Joe Johnson", "BabyBobby87", "13243#@32", "0123432jk32jk"]
        for c in cases:
            n = textproc.Processor(c)
            z = 0
            for ch in c:
                if ch >='0' and ch<='9':
                    z+=1
            self.assertEqual(n.count_numeric(), z)
    
    def test_count_vowels(self):
        cases = ["runoowoQ", "babyBobby", "somebodyIusedtoknow", "jiol,m bjreeqwertuioaecmz!@1"]
        v = set(['a', 'e', 'i', 'o', 'u'])
        for c in cases:
            h = textproc.Processor(c)
            vC = 0
            for ch in c:
                if ch.lower() in v:
                    vC+=1
            self.assertEqual(h.count_vowels(), vC)

    def test_is_phonenumber(self):
        cases = ["303-410-1456", "393 419 1456", "(303) 410 1456", "3034101453"]
        for c in cases:
            p = textproc.Processor(c)
            self.assertEqual(p.is_phonenumber(), True)


    # Add Your Test Cases Here...

# Main: Run Test Cases
if __name__ == '__main__':
    unittest.main()
