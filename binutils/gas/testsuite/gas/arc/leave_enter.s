	.cpu HS
	leave_s {r13-r13}
	leave_s {r13-r26,pcl}
	leave_s {r13-r26,fp}
	leave_s {r13-r26,blink}
	leave_s {r13-r26,fp,blink}
	leave_s {r13-r26,fp,pcl}
	leave_s {r13-r26,blink,pcl}
	leave_s {r13-r26,fp,blink,pcl}

	ld 	r0,[r1]

	enter_s {r13-r13}
	enter_s {r13-r26,fp}
	enter_s {r13-r26,blink}
	enter_s {r13-r26,fp,blink}
