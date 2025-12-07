const builtin = @import("builtin");
const std = @import("std");

pub fn build(b: *std.Build) void {
    const arch = b.option(
        std.Target.Cpu.Arch,
        "target",
        "The target arch",
    ) orelse builtin.cpu.arch;

    const target = b.resolveTargetQuery(.{ .cpu_arch = arch });
    const mod = b.createModule(.{ .target = target });

    const src = b.path("src");
    mod.addAssemblyFile(
        src.path(
            b,
            switch (arch) {
                .aarch64 => "aarch64.S",
                else => @panic("unsupported target"),
            },
        ),
    );

    const obj = b.addObject(.{ .name = "hi", .root_module = mod });
    const copy = b.addObjCopy(obj.getEmittedBin(), .{ .format = .bin });

    const install = b.addInstallBinFile(copy.getOutput(), obj.name);
    b.getInstallStep().dependOn(&install.step);
}
