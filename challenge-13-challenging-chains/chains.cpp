#include <array>
#include <fstream>

using namespace std;

class ChainNode {
  public:
    int x;
    int y;
    ChainNode *next;
};

class ListNode {
  public:
    ChainNode *chain;
    ListNode *next;
};

ChainNode *get_containing_chain(int x, int y) {

}

array<array<int, 64>, 32> read_input(char *file_path) {
  fstream input_file;
  input_file.open(file_path, ios::out);
}

int count_total_chain_length(ListNode *chain_list) {
  
}

int main() {

}
