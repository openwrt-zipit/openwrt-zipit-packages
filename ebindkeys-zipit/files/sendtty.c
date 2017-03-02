#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>

int main(int argc, char **argv)
{
  int hTTY;
  char c[2] = " ";

  if (argc < 3)
    printf("USAGE:  %s /dev/tty63 c\n", argv[0]);
  else
  {
    if ((hTTY = open(argv[1], O_WRONLY|O_NONBLOCK)) < 0)
      return hTTY;
    while (c[0] = *(argv[2]++)) { // Send a string to the tty.
      ioctl(hTTY, TIOCSTI, c);
      c[0] = c[0] | 0x80; // press and release
      ioctl(hTTY, TIOCSTI, c);
    }
    close(hTTY);
  }
  return 0;
}
