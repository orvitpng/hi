const builtin = @import("builtin");
const std = @import("std");

const arches: []const Arch = &.{
    .{ "aarch64.S", .aarch64 },
};

pub fn build(b: *std.Build) void {
    const src = b.path("src");
    for (arches) |arch| {
        const target = b.resolveTargetQuery(.{ .cpu_arch = arch.@"1" });
        const mod = b.createModule(.{ .target = target });
        mod.addAssemblyFile(src.path(b, arch.@"0"));

        const obj = b.addObject(.{
            .name = @tagName(arch.@"1"),
            .root_module = mod,
        });
        const copy = b.addObjCopy(obj.getEmittedBin(), .{ .format = .bin });

        const install = b.addInstallBinFile(copy.getOutput(), obj.name);
        b.getInstallStep().dependOn(&install.step);
    }
}

const Arch = struct {
    []const u8,
    std.Target.Cpu.Arch,
};
