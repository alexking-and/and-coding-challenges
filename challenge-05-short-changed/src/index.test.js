const test = require('ava');
const { getBestChange } = require('./index.js');

// Transaction: £7.11
// Cash Provided: £10
test('sample transaction 1', t => {
  const result = getBestChange("£7.11", "£10");
  
  t.is(result.filter(i => i.display === "£2").length, 1);
  t.is(result.filter(i => i.display === "50p").length, 1);
  t.is(result.filter(i => i.display === "20p").length, 1);
  t.is(result.filter(i => i.display === "10p").length, 1);
  t.is(result.filter(i => i.display === "5p").length, 1);
  t.is(result.filter(i => i.display === "2p").length, 2);
  t.is(result.length, 7);
});

// Transaction: £5.52
// Cash Provided: £7
test('sample transaction 2', t => {
  const result = getBestChange("£5.52", "£7");
  
  t.is(result.filter(i => i.display === "£1").length, 1);
  t.is(result.filter(i => i.display === "20p").length, 2);
  t.is(result.filter(i => i.display === "5p").length, 1);
  t.is(result.filter(i => i.display === "2p").length, 1);
  t.is(result.filter(i => i.display === "1p").length, 1);
  t.is(result.length, 6);
});

// Transaction: £15.23
// Cash Provided: £20
test('sample transaction 3', t => {
  const result = getBestChange("£15.23", "£20");
  
  t.is(result.filter(i => i.display === "£2").length, 2);
  t.is(result.filter(i => i.display === "50p").length, 1);
  t.is(result.filter(i => i.display === "20p").length, 1);
  t.is(result.filter(i => i.display === "5p").length, 1);
  t.is(result.filter(i => i.display === "2p").length, 1);
  t.is(result.length, 6);
});

// Transaction: £0.50
// Cash Provided: £5
test('sample transaction 4', t => {
  const result = getBestChange("£0.50", "£5");
  
  t.is(result.filter(i => i.display === "£2").length, 2);
  t.is(result.filter(i => i.display === "50p").length, 1);
  t.is(result.length, 3);
});

// Transaction: £8.85
// Cash Provided: £10
test('sample transaction 5', t => {
  const result = getBestChange("£8.85", "£10");
  
  t.is(result.filter(i => i.display === "£1").length, 1);
  t.is(result.filter(i => i.display === "10p").length, 1);
  t.is(result.filter(i => i.display === "5p").length, 1);
  t.is(result.length, 3);
});
