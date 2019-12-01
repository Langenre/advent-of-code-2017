const R = require('ramda');
const fs = require('fs');

const input = fs.readFileSync('day6_typescript/input.txt', 'utf8')
    .split('\t')
    .map(num => parseInt(num, 10));

const max = values => R.reduce(R.max(), Number.MIN_VALUE, values);

function balance(prevState: Array<number>): Array<number> {
    const index = R.findIndex(R.equals(max(prevState)), prevState);
    return R.apply(R.pipe, [
        R.update(index, 0),
        ...R.map(
            count => R.adjust(R.add(index, count) % 16, R.inc),
            R.range(1, R.view(R.lensIndex(index), prevState) + 1)
        ),
    ])(prevState);
}

function redistributionCycle(memoryBanks: Array<number>) {
    let history = [];
    function redistribute(memoryBanks, round) {
        const nextState = balance(memoryBanks);
        const cycleComplete: boolean = R.contains(nextState, history);
        history.push(nextState);
        return cycleComplete
            ? round
            : redistribute(nextState, R.inc(round))
    }
    return redistribute(memoryBanks, 1);
}

const cycles = redistributionCycle(input);

console.log(cycles);