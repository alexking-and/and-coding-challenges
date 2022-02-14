const fs = require('fs');

const toPennies = (moneyString) => {
  const moneyMatches = moneyString.match(/£?(\d+)(?:.(\d\d))?p?/);
  return moneyString.includes('£')
    ? parseInt(moneyMatches[1]) * 100 + (parseInt(moneyMatches[2]) || 0)
    : parseInt(moneyMatches[1]);
};

const printResult = (changeGiven) =>
  Object.entries(
    changeGiven.reduce((acc, cur) => ({ ...acc, [cur.display]: (acc[cur.display] || 0) + 1 }), {})
  ).forEach(([key, value]) => console.log(`${value} x ${key}`));

const cashDrawer = fs
  .readFileSync('data/cash_drawer.txt', 'utf-8')
  .split('\n')
  .filter((line) => line.length > 1)
  .flatMap((line) =>
    Array(parseInt(line.split(' x ')[0])).fill({
      display: line.split(' x ')[1],
      value: toPennies(line.split(' x ')[1])
    })
  );

const getBestChange = (transactionValue, cashProvided) => {
  const remainingCash = [...cashDrawer].reverse();
  const changeGiven = [];
  let changeRemaining = toPennies(cashProvided) - toPennies(transactionValue);
  while (changeRemaining > 0 && remainingCash.length) {
    const cashItem = remainingCash.pop();
    if (cashItem.value <= changeRemaining) {
      changeGiven.push(cashItem);
      changeRemaining -= cashItem.value;
    }
  }

  if (changeRemaining < 0 || !remainingCash.length) {
    console.log('Exact change is not possible');
    return [];
  }
  return changeGiven;
};

if (require.main === module) printResult(getBestChange(process.argv[2], process.argv[3]));

module.exports = { getBestChange };
