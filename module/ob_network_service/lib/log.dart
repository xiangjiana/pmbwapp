bool isLog = true;
void log(Object t) {
  if (!isLog) return;
  print(t);
}
