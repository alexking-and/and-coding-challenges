import std.stdio : writeln;
import std.array : replace;
import std.algorithm.iteration : fold;

///
int parseNumeral(string _s) pure {
	immutable int[dchar] numerals = [
		'M': 1000,
		'D': 500,
		'C': 100,
		'L': 50,
		'X': 10,
		'V': 5,
		'I': 1
	];
	immutable string[string] subExceptions = [
		"IV": "IIII",
		"IX": "VIIII",
		"XL": "XXXX",
		"XC": "LXXXX",
		"CD": "CCCC",
		"CM": "DCCCC"
	];

	string s = _s;
	foreach (key, value; subExceptions) {
		s = replace(s, key, value);
	}

	return s.dup.fold!((acc, cur) => acc + numerals[cur])(0);
}

///
bool compare(string a, string b) pure {
	return parseNumeral(a) < parseNumeral(b);
}

void main(string[] args) {
	if (args.length != 3) {
		writeln("Please provide two Roman numeral strings as arguments");
	} else {
		writeln("Result: ", compare(args[1], args[2]));
	}
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
