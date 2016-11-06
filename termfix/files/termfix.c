/* From https://gist.github.com/joerick/9e2d244f456c2431619e7063eda62e1d/
 * Unknown License
 */

#include <sys/ioctl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <linux/vt.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/kd.h>
#include <linux/keyboard.h>

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("usage: termfix /dev/ttyX\n");
        return 2;
    }

    int fd = open(argv[1], O_RDWR, 0);
    int res = ioctl(fd, VT_UNLOCKSWITCH, 1);

    if (res != 0) {
        perror("ioctl VT_UNLOCKSWITCH failed");
        return 3;
    }

    ioctl(fd, KDSETMODE, KD_TEXT);

    if (res != 0) {
        perror("ioctl KDSETMODE failed");
        return 3;
    }

    printf("Success\n");

    return res;
}
