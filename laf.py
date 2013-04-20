#!/usr/bin/python
# -*- coding: utf-8 -*-

''' 
I am writing my Ph.D. Thesis and I have to compile 
a list of acronyms in from my text. Instead of scanning 
through my text, this piece of code looks for them (*.tex).

Most common acronyms are: ALL CAPS, or CamelCASE. 
(at the moment there are no other variants: CamelCase)

My thesis is structured in chapters, with each one in its
corresponding tex file. All the acronyms are in their own 
text file (e.g., lists.tex)
'''
import sys
import os
import subprocess
import re

camel_case 	= re.compile('(?:[A-Z])(?:[a-z])+(?:[A-Z])+') #e.g., WebRTC, QoS, QoE
only_word	= re.compile("[^\w']")	# ignore alphaneumeric
parantheses = re.compile("\((.*)\)") # (words)

def print_list(_list):
	for t in _list:
		print t

def main(args):
	findCommand = 'find . -type f -iregex \'.*\.tex\' -print'
	print "Command:", findCommand
	texFiles = subprocess.check_output(findCommand, shell=True).split()
	# print texFiles
	# texFiles = filter(None, texFiles)
	inList = []
	newList = []
	for t in texFiles:
		print "Reading File:", t
		f = file(t).read()
		for word in f.split():
			
			# In latex some words are immediately followed by ~
			# Typically for \cite{} or \ref{}
			if (word.find('~')!=-1):
				w = word.split('~')
				# just keeping the first part of the word, 
				# everything after ~ is prolly a latex command
				word=w[0]
				# print w
			
			# Fetching words inside (parantheses)
			res = parantheses.search( word )
			if(res!=None):
				word=res.group(1)
				# print "parantheses", word
			
			# check if Word is uppercase
			# check CamelCase
			if (word.isupper() or camel_case.match(word)!=None):
				accr=only_word.sub('', word)
				if(len(accr)>1): 
					# create list of acronyms already in list
					# create list of acronyms in chapters 
					if(t.find('lists')!=-1): #t=="lists.tex" 
						if accr not in inList:
						    inList.append(accr)
					else:
						if accr not in newList:
						    newList.append(accr)
	newList.sort()
	# print "newList: ", newList
	inList.sort()
	# print "inList: ", inList
	
	#compare the lists and report missing and extra ones.
	print "Consider adding these"
	print_list(set(newList)-set(inList))
	print "\nConsider removing these: (not in use):"
	print_list(set(inList)-set(newList))

if __name__ == "__main__":
	main(sys.argv[1:])
