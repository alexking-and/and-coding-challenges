import nltk, sys, time, requests
from nltk.tokenize import word_tokenize
from nltk.corpus import words

wordset = set(words.words())

def calculate_line_score(line):
  tokens = word_tokenize(line)
  recognised_words = sum(1 for token in tokens if (token in wordset))
  return recognised_words / len(tokens)

def fetch_poem_metadata(line):
  try:
    response = requests.get(f"https://poetrydb.org/lines/{line}").json()[0]
    return response["author"], response["title"]
  except:
    pass
  try:
    # Try again up until first comma
    response = requests.get(f"https://poetrydb.org/lines/{line.split(',')[0]}").json()[0]
    return response["author"], response["title"]
  except:
    return "Author not found", "Title not found"

def main(filename):
  print("Reading file...")
  f = open(filename, "r")
  lines = f.readlines()

  print("Calculating line scores...")
  start_time = time.time()
  lines.sort(key=calculate_line_score, reverse=True)
  end_time = time.time()
  print(f"Done in {end_time - start_time} seconds.")

  print("The three lines of poetry are:")
  for line in lines[:3]:
    author, title = fetch_poem_metadata(line)
    print(f"\"{line.strip()}\" from {title} by {author}")

  f.close()

if __name__ == "__main__":
  if len(sys.argv) < 2:
    main("poetry.txt")
  else:
    main(sys.argv[1])
