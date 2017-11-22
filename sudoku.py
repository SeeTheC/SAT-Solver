#!/usr/bin/env python

from __future__ import print_function

count1 = 0
for x in range(1, 10):
	for y in range(1, 10):
#		for z in range (1, 10):
#			print(str(x) + str(y) + str(z), end=" ")
		count1 += 1
#		print("\n", end="")

count2 = 0
for y in range(1, 10):
	for z in range(1, 10):
		for x in range(1, 9):
			for i in range(x + 1, 10):
				count2 += 1
#				print("-" + str(x) + str(y) + str(z) + " " + "-" + str(i) + str(y) + str(z))

count3 = 0
for x in range(1, 10):
	for z in range(1, 10):
		for y in range(1, 9):
			for i in range(y + 1, 10):
				count3 += 1
#				print("-" + str(x) + str(y) + str(z) + " " + "-" + str(x) + str(i) + str(z))

count4 = 0
for z in range(1, 10):
	for i in range(0, 3):
		for j in range(0, 3):
			for x in range(1, 4):
				for y in range(1, 4):
					for k in range(y + 1, 4):
						count4 += 1
						print("-" + str(3 * i + x) + str(3 * j + y) + str(z) + " " + "-" + str(3 * i + x) + str(3 * j + k) + str(z))

count5 = 0
for z in range(1, 10):
	for i in range(0, 3):
		for j in range(0, 3):
			for x in range(1, 4):
				for y in range(1, 4):
					for k in range(x + 1, 4):
						for l in range(1, 4):
							count5 += 1
							print("-" + str(3 * i + x) + str(3 * j + y) + str(z) + " " + "-" + str(3 * i + k) + str(3 * j + l) + str(z))

count6 = 0
for x in range(1, 10):
	for y in range(1, 10):
		for z in range(1, 9):
			for i in range(z + 1, 10):
				count6 += 1
#				print("-" + str(x) + str(y) + str(z) + " " + "-" + str(x) + str(y) + str(i))

count7 = 0
for y in range(1, 10):
	for z in range(1, 10):
#		for x in range(1, 10):
#			print(str(x) + str(y) + str(z), end=" ")
		count7 += 1
#		print("\n", end="")

count8 = 0
for x in range(1, 10):
	for z in range(1, 10):
#		for y in range(1, 10):
#			print(str(x) + str(y) + str(z), end=" ")
		count8 += 1
#		print("\n", end="")

print(count1, count2, count3, count4, count5, count6, count7, count8)
