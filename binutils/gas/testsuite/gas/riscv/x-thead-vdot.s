
.text

test_int8_int4:
	th.vmaqa.vv v0, v0, v0, v0.t
	th.vmaqa.vv v0, v0, v0
	th.vmaqa.vv v0, v2, v1

	th.vmaqa.vx v0, x0, v0, v0.t
	th.vmaqa.vx v0, x0, v0
	th.vmaqa.vx v0, x2, v1

	th.vmaqau.vv v0, v0, v0, v0.t
	th.vmaqau.vv v0, v0, v0
	th.vmaqau.vv v0, v2, v1

	th.vmaqau.vx v0, x0, v0, v0.t
	th.vmaqau.vx v0, x0, v0
	th.vmaqau.vx v0, x2, v1

	th.vmaqasu.vv v0, v0, v0, v0.t
	th.vmaqasu.vv v0, v0, v0
	th.vmaqasu.vv v0, v2, v1

	th.vmaqasu.vx v0, x0, v0, v0.t
	th.vmaqasu.vx v0, x0, v0
	th.vmaqasu.vx v0, x2, v1

	th.vmaqaus.vx v0, x0, v0, v0.t
	th.vmaqaus.vx v0, x0, v0
	th.vmaqaus.vx v0, x2, v1
