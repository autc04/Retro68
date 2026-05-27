	.gnu_subsection gnu_foo, required, uleb128
	.gnu_attribute 1, 1

	.gnu_subsection gnu_bar, optional, uleb128
	.gnu_attribute 0, 1
	.gnu_attribute 1, 0
	.gnu_attribute 2, 1

	.gnu_subsection foo_1, optional, uleb128
	.gnu_attribute 1, 1

	.gnu_subsection foo_2, optional, uleb128
	.gnu_attribute 0, 1
	.gnu_attribute 1, 1

	.gnu_subsection foo_1, optional, uleb128
	.gnu_attribute 2, 0

	.gnu_subsection foo_2, optional, uleb128
	.gnu_attribute 1, 1

	.gnu_subsection foo_1, optional, uleb128
	.gnu_attribute 2, 0

	.gnu_subsection foo_1, optional, uleb128
	.gnu_attribute 3, 0
	.gnu_attribute 4, 0

	.gnu_subsection foo_3, optional, ntbs
	.gnu_attribute 0, "hello"
	.gnu_attribute 1, "world"
