# linux-tips

# Get IP Address information on your Linux Virtual Machine Terminal

1. as sudo open the file /etc/issue using vi / nano / vim editor
2. now append the line \4 {your_ethernet_interface_name} | for example: \4{enp0s3}
3. Save and Quit
4. You are done.
   You now get to see the ip address of your Virtual Machine each time you turn it on.
   ![Login Screen on VM](https://github.com/maheshgprasad/linux-tips/blob/master/Azrael_1.PNG)

# To find something within a file recursively using " grep " Command

grep - r "_search-term_" /path/to/file

# To count the number of times a search term appears within a file.

grep - c "_search-term_" /path/to/file

# To Create Multiple directories using a for loop.

for i in dir1 dir2 dir3 dir4; do mkdir /path/where/you/need/new/directories $i; done

|| simplified. for i in dir1 dir2 dir3 dir4; do mkdir $i; done

# To Create Multiple Files in a directory using for loop.

for i in file1 file2 file3 file4; do touch $i; done

# Useful Rsync flags

- -I, --ignore-times
  Normally rsync will skip any files that are already the same size and have the same modification timestamp.
  This option turns off this lqquick checkrq behavior, causing all files to be updated.
- -K, --keep-dirlinks
  This option causes the receiving side to treat a symlink to a directory as though it were a real directory,but only if it matches a real directory from     the sender.
  Without this option, the receiver's symlink would be deleted and replaced with a real directory.

- -r, --recursive : This tells rsync to copy directories recursively. See also --dirs (-d).
- -v, --verbose
- -a, --archive
  This is equivalent to -rlptgoD. It is a quick way of saying you want recursion and want to preserve almost everything (with -H being a notable omission).
- -e, --rsh=COMMAND
  This option allows you to choose an alternative remote shell program to use for communication between the local and remote copies of rsync.
  Typically, rsync is configured to use ssh by default, but you may prefer to use rsh on a local network.
  If this option is used with [user@]host::module/path
- -c, --checksum skip based on checksum, not mod-time & size
- -t, --times preserve modification times
- -z, --compress compress file data during the transfer
