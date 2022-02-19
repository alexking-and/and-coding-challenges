const test = require('ava');
const { bucketify } = require('./bucketify');

const sampleSet = [
  {
    inputS: 'the quick brown fox jumps over the lazy dog',
    inputN: 10,
    expectedOutput: ['the quick', 'brown fox', 'jumps over', 'the lazy', 'dog']
  },
  {
    inputS: 'the five boxing wizards jump quickly',
    inputN: 7,
    expectedOutput: ['the', 'five', 'boxing', 'wizards', 'jump', 'quickly']
  },
  {
    inputS: 'a b c d e f g',
    inputN: 2,
    expectedOutput: ['a', 'b', 'c', 'd', 'e', 'f', 'g']
  },
  {
    inputS: 'how vexingly quick daft zebras jump',
    inputN: 12,
    expectedOutput: ['how vexingly', 'quick daft', 'zebras jump']
  }
];

test('buckets do not containing leading or trailing spaces', ({ deepEqual }) => {
  deepEqual(bucketify('space nerds ate my hedgehog', 8), ['space', 'nerds', 'ate my', 'hedgehog']);
});

test('discards oversized words', ({ deepEqual }) => {
  deepEqual(bucketify('words that are big and small', 4), ['that', 'are', 'big', 'and']);
});

test('passes sample set', ({ deepEqual }) => {
  sampleSet.forEach(({ inputS, inputN, expectedOutput }) => deepEqual(bucketify(inputS, inputN), expectedOutput));
});
