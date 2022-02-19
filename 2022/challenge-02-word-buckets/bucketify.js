const bucketify = (s, n) => s
  .split(' ')
  .reduce((acc, cur) =>
    cur.length > n
    ? acc
    : (
      !acc.length
      ? [cur]
      : (
        acc[acc.length - 1].length + cur.length + 1 > n
        ? [...acc, cur]
        : [...acc.slice(0, acc.length - 1), `${acc[acc.length - 1]} ${cur}`]
      )
    ),
    []
  );

module.exports = { bucketify };
