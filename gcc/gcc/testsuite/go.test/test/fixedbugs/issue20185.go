// errorcheck

// Copyright 2017 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Issue 20185: type switching on untyped values (e.g. nil or consts)
// caused an internal compiler error.

package p

func F() {
	switch t := nil.(type) { // ERROR "cannot type switch on non-interface value|defined to nil type"
	default:
		_ = t
	}
}

const x = 1

func G() {
	switch t := x.(type) { // ERROR "cannot type switch on non-interface value|declared but not used"
	default:
	}
}
