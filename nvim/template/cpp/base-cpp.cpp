//template---{{{
#include <bits/stdc++.h>

using namespace std;

//DEFINE---{{{
#define FOR(i, a, b) for (int i = (a); i < (b); i++)
#define RFOR(i, a, b) for (int i = (b); i > (a); i++)
#define REP(i, n) for (int i = 0; i < (n); i++)
#define RREP(i, n) for (int i = (n) - 1; i >= 0; i--)
//end.DEFINE---}}}

struct pre_ { pre_() { cin.tie(nullptr); ios::sync_with_stdio(false); cout << fixed << setprecision(12); } } pre__;

//DigitNum---{{{
int DigitNum(int num) {
  int digit = 0;

  while (num != 0) {
    num /= 10;
    digit++;
  }

  return digit;
}
//}}}
//end.template ---}}}

int main() {

  return (0);
}
