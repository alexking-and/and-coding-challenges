import nltk, sys, time
from nltk.tokenize import word_tokenize
from nltk.corpus import words

wordset = set(words.words())

class PoetryLine:
  def __init__(self, line, score):
    self.line = line
    self.score = score

def calculate_line_score(line):
  tokens = word_tokenize(line)
  recognised_words = sum(1 for token in tokens if (token in wordset))
  return recognised_words / len(tokens)

def main(filename):
  start_time = time.time()
  print("Reading file...")
  f = open(filename, "r")
  lines = f.readlines()
  print("Calculating line scores...")
  lines.sort(key=calculate_line_score, reverse=True)
  end_time = time.time()
  print(f"Done in {end_time - start_time} seconds. The three lines of poetry are:")
  for line in lines[:3]:
    print(line.strip())
  f.close()

if __name__ == "__main__":
  if len(sys.argv) < 2:
    main("poetry.txt")
  else:
    main(sys.argv[1])
