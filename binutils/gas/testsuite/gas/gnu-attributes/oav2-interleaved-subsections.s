	.gnu_subsection gnu_abi, required, uleb128

	.gnu_subsection gnu_feature_and_bits, optional, uleb128
	.gnu_attribute 0, 1

	.gnu_subsection gnu_feature_and_bits

	.gnu_subsection foo_1, optional, uleb128
	.gnu_attribute 1, 1

	.gnu_subsection gnu_abi
	.gnu_attribute 2, 1

	.gnu_subsection gnu_feature_and_bits
	.gnu_attribute 2, 1

	.gnu_subsection foo_1
	.gnu_attribute 2, 0

	.gnu_subsection gnu_abi
	.gnu_attribute 1, 1

	.gnu_subsection gnu_abi
	.gnu_subsection gnu_feature_and_bits
	.gnu_attribute 1, 0

	.gnu_subsection foo_1
	.gnu_attribute 3, 0
	.gnu_attribute 4, 0

	.gnu_subsection gnu_feature_and_bits
	.gnu_attribute 1, 0
