# Vcpkg registry
Unofficial vcpkg registry for unsupported packages.

### Package list.
- [cvplot](https://github.com/leovandriel/cvplot)

### Integrate registry with vcpkg instance.
Create `vcpkg-configuration.json` in vcpkg root directory, with this content.
```json
{
	"registries":
	[{
		"kind": "git",
		"repository": "https://github.com/Jaz-Wazz/vcpkg-registry",
		"baseline": "f010faf0fe06aefcae2376bb060c426a1a73928e",
		"packages": ["cvplot"]
	}]
}
```

### Install package from registry.
Integration very native. Do all the same as before, but with new packages.
```bash
vcpkg install cvplot --triplet=x64-windows-static --host-triplet=x64-windows-static --clean-after-build --no-binarycaching
```

### Maintainers add/update process reference.
1. Add/Update `ports/<package>/*` files and commit changes.
2. Get git-tree hash for new package commit, using `git rev-parse HEAD:ports/<package>`.
3. Add/Update `versions/<first package letter>-/<package>.json`, using git-tree hash.
4. Add/Update last package version in `versions/baseline.json` and commit changes to publish package.
5. Get a hash from commit with `versions/baseline.json` changes, using `git rev-parse HEAD`.
6. Update "Integrate" section from `readme.md`, using hash to change "baseline" and commit changes.

### For more information visit:
- [Vcpkg registries maintainers.](https://github.com/microsoft/vcpkg/blob/master/docs/maintainers/registries.md)
- [Vcpkg registries users.](https://github.com/microsoft/vcpkg/blob/master/docs/users/registries.md)
- [Registries: Bring your own libraries to vcpkg.](https://devblogs.microsoft.com/cppblog/registries-bring-your-own-libraries-to-vcpkg)
