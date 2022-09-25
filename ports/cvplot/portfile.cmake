# Download.
vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO leovandriel/cvplot
	REF 0.0.4
	SHA512 952d29af112f5f2248461ed4bd86eb294e0081a8b560c27e114a1c41cfcd1a9aff40bb737440f1cc32582bd57328a52034ff6caf902414faece181c8ab08a3e9
	HEAD_REF main
)

# Configure.
vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)

# Build.
vcpkg_install_cmake()

# Fix include duplicate.
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Copy copyright.
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Copy custom cmake find module.
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/cvplotConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
