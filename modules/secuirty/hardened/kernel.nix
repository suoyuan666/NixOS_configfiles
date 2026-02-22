{ config, lib, ... }:

{
  boot.kernel.sysctl = {
    # --- Kernel & CPU ---
    # Disable core dumps to prevent sensitive info leaks
    "kernel.core_pattern" = "|/bin/false";
    # Restrict kernel pointer access to prevent ASLR bypasses
    "kernel.kptr_restrict" = 2;
    # Restrict dmesg access to privileged users only
    "kernel.dmesg_restrict" = 1;
    # Disable unprivileged eBPF to mitigate a massive attack surface
    "kernel.unprivileged_bpf_disabled" = 1;
    # JIT Hardening for eBPF
    "net.core.bpf_jit_harden" = 2;
    # Prevent loading of TTY line disciplines to stop certain privilege escalations
    "dev.tty.ldisc_autoload" = 0;
    # Disable unprivileged userfaultfd to mitigate heap spray attacks
    "vm.unprivileged_userfaultfd" = 0;
    # Disable kexec (prevents replacing the running kernel)
    "kernel.kexec_load_disabled" = 1;
    # SysRq: 4 = control of keyboard layout. 
    "kernel.sysrq" = 4;
    # Restrict ptrace to child processes (prevents cross-process memory sniffing)
    "kernel.yama.ptrace_scope" = 1;

    "kernel.unprivileged_userns_clone" = 1;

    # --- Network ---
    # Mitigate SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;
    # Protect against time-wait assassination
    "net.ipv4.tcp_rfc1337" = 1;
    # Disable TCP timestamps (prevents uptime detection and side-channel leaks)
    "net.ipv4.tcp_timestamps" = 0;
    # Reverse Path Filtering (prevents IP spoofing)
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    # Refuse ICMP redirects (prevents MITM via routing table manipulation)
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    # Do not send ICMP redirects
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    # Ignore all PING requests
    "net.ipv4.icmp_echo_ignore_all" = 1;
    # Disable Source Routing
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;
    # IPv6 Privacy Extensions (use temporary addresses)
    "net.ipv6.conf.all.use_tempaddr" = 2;
    "net.ipv6.conf.default.use_tempaddr" = 2;
    # Disable Router Advertisements (Manual/DHCPv6 only). 
    # NOTE: Set to 1 if IPv6 connectivity breaks.
    "net.ipv6.conf.all.accept_ra" = 0;
    "net.ipv6.conf.default.accept_ra" = 0;

    # --- Virtual Memory & ASLR ---
    # Maximize ASLR entropy bits for 64-bit systems
    "vm.mmap_rnd_bits" = 32;
    "vm.mmap_rnd_compat_bits" = 16;

    # --- File System ---
    "fs.protected_symlinks" = 1;
    "fs.protected_hardlinks" = 1;
    "fs.protected_fifos" = 2;
    "fs.protected_regular" = 2;
  };
}
