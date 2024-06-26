{pkgs, ...}: {
  # Hard Disk mount for ntfs.
  boot.supportedFilesystems = ["ntfs"];
}
