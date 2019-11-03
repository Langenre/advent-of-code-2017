const R = require('ramda');
const fs = require('fs');

const input = fs.readFileSync('input.txt', 'utf8').split('\n').map(number => parseInt(number));

function solve(input) {
  let instructions = R.clone(input);
  let index = 0;
  let count = 0;

  while (index < input.length) {
    const offset = instructions[index];
    instructions = R.update(index, R.inc(offset), instructions);
    index = R.add(index, offset);
    count = R.inc(count);
  }

  return count;
}

const result = solve(input);
console.log(result);