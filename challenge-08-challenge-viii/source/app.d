import std.stdio;
import std.algorithm.iteration;

///
int parseNumeral(string s) {
	immutable int[dchar] numerals = [
		'M': 1000,
		'D': 500,
		'C': 100,
		'L': 50,
		'X': 10,
		'V': 5,
		'I': 1
	];

	return s.dup.fold!((acc, cur) => acc + numerals[cur])(0);
}

///
bool compare(string a, string b) {
	return parseNumeral(a) < parseNumeral(b);
}

void main() {
	// TODO
	writeln("I: ", parseNumeral("I"));
}

unittest {
	// Example
	assert(compare("VI", "MMMCXI") == true);

	// Additive notation
	assert(parseNumeral("I") == 1);
	assert(parseNumeral("XXXXIIII") == 44);
	assert(parseNumeral("MMMCXI") == 3111);

	// Subtractive notation
	assert(parseNumeral("IV") == 4);
	assert(parseNumeral("IXIV") == 13);
	assert(parseNumeral("XCIX") == 99);
}
