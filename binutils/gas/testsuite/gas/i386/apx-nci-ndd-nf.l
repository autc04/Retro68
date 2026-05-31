.* Assembler messages:
.*:14: Error: no EVEX encoding for `add'
.*:15: Error: .* `add'
.*:16: Error: `{nf}' is not supported on `generic64\..*\.apx_f'
.*:18: Error: .* `adox'
.*:20: Error: `{nf}' is not supported on `generic64\..*\.apx_f'
.*:21: Error: `ccmpz' is not supported on `generic64\..*\.apx_f'
.*:22: Error: `cfcmovz' is not supported on `generic64\..*\.apx_f'
.*:23: Error: `cfcmovz' is not supported on `generic64\..*\.apx_f'
.*:24: Error: `cfcmovz' is not supported on `generic64\..*\.apx_f'
.*:25: Error: .* `cmovz'
.*:26: Error: no EVEX encoding for `cmp'
.*:27: Error: no EVEX encoding for `lzcnt'
.*:28: Error: `{nf}' is not supported on `generic64\..*\.apx_f'
.*:29: Error: no EVEX encoding for `tzcnt'
# NCI
.*:14: Error: no EVEX encoding for `add'
.*:15: Error: .* `add'
.*:16: Error: `{nf}' is not supported on `generic64\..*\.apx_nci'
.*:18: Error: .* `adox'
.*:20: Error: `{nf}' is not supported on `generic64\..*\.apx_nci'
.*:27: Error: no EVEX encoding for `lzcnt'
.*:28: Error: `{nf}' is not supported on `generic64\..*\.apx_nci'
.*:29: Error: no EVEX encoding for `tzcnt'
# NDD
.*:16: Error: `{nf}' is not supported on `generic64\..*\.apx_ndd'
.*:20: Error: `{nf}' is not supported on `generic64\..*\.apx_ndd'
.*:21: Error: `ccmpz' is not supported on `generic64\..*\.apx_ndd'
.*:22: Error: `cfcmovz' is not supported on `generic64\..*\.apx_ndd'
.*:23: Error: `cfcmovz' is not supported on `generic64\..*\.apx_ndd'
.*:24: Error: `cfcmovz' is not supported on `generic64\..*\.apx_ndd'
.*:25: Error: .* `cmovz'
.*:26: Error: no EVEX encoding for `cmp'
.*:28: Error: `{nf}' is not supported on `generic64\..*\.apx_ndd'
# NF
.*:14: Error: no EVEX encoding for `add'
.*:15: Error: .* `add'
.*:16: Error: .* `add'
.*:18: Error: .* `adox'
.*:21: Error: `ccmpz' is not supported on `generic64\..*\.apx_nf'
.*:22: Error: `cfcmovz' is not supported on `generic64\..*\.apx_nf'
.*:23: Error: `cfcmovz' is not supported on `generic64\..*\.apx_nf'
.*:24: Error: `cfcmovz' is not supported on `generic64\..*\.apx_nf'
.*:25: Error: .* `cmovz'
.*:26: Error: no EVEX encoding for `cmp'
.*:27: Error: no EVEX encoding for `lzcnt'
.*:28: Error: .* `popcnt'
.*:29: Error: no EVEX encoding for `tzcnt'
#...
[ 	]*[0-9]+[ 	]+\.irp feat, .*
#...
[ 	]*[0-9]+[ 	]+\.endr
#...
[ 	]*[0-9]+[ 	]+> apx_f:
#...
[ 	]*[0-9]+[ 	]+> +\.arch \.apx_f
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+> +\{evex\} add %r16,%r17
[ 	]*[0-9]+[ 	]+> +add %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{nf\} add %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+> +adox %r16,%r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+> +adox %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+> +andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+> +\{nf\} andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +ccmpz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{load\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{store\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +cfcmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +cmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{evex\} cmp %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{evex\} lzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{nf\} popcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{evex\} tzcnt %r16,%r17
#...
[ 	]*[0-9]+[ 	]+> apx_nci:
#...
[ 	]*[0-9]+[ 	]+> +\.arch \.apx_nci
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+> +\{evex\} add %r16,%r17
[ 	]*[0-9]+[ 	]+> +add %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{nf\} add %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+> +adox %r16,%r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+> +adox %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+> +andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+> +\{nf\} andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+\?+ 62EC8404[ 	]+> +ccmpz %r16,%r17
[ 	]*[0-9]+[ 	]+39C1
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{load\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62ECFC0C[ 	]+> +\{store\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+44C1
[ 	]*[0-9]+[ 	]+\?+ 62ECEC14[ 	]+> +cfcmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62ECEC10[ 	]+> +cmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62EC840A[ 	]+> +\{evex\} cmp %r16,%r17
[ 	]*[0-9]+[ 	]+39C1
[ 	]*[0-9]+[ 	]+> +\{evex\} lzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{nf\} popcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{evex\} tzcnt %r16,%r17
#...
[ 	]*[0-9]+[ 	]+> apx_ndd:
#...
[ 	]*[0-9]+[ 	]+> +\.arch \.apx_ndd
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} add %r16,%r17
[ 	]*[0-9]+[ 	]+01C1
[ 	]*[0-9]+[ 	]+\?+ 62ECEC10[ 	]+> +add %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+01C1
[ 	]*[0-9]+[ 	]+> +\{nf\} add %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+> +adox %r16,%r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+\?+ 62ECEE10[ 	]+> +adox %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+> +andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+> +\{nf\} andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +ccmpz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{load\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{store\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +cfcmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +cmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{evex\} cmp %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} lzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+F5C8
[ 	]*[0-9]+[ 	]+> +\{nf\} popcnt %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} tzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+F4C8
#...
[ 	]*[0-9]+[ 	]+> apx_nf:
#...
[ 	]*[0-9]+[ 	]+> +\.arch \.apx_nf
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+> +\{evex\} add %r16,%r17
[ 	]*[0-9]+[ 	]+> +add %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{nf\} add %r16,%r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+> +adox %r16,%r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+> +adox %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+> +andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+\?+ 62EAF404[ 	]+> +\{nf\} andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+> +ccmpz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{load\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{store\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+> +cfcmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +cmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+> +\{evex\} cmp %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{evex\} lzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{nf\} popcnt %r16,%r17
[ 	]*[0-9]+[ 	]+> +\{evex\} tzcnt %r16,%r17
#...
[ 	]*[0-9]+[ 	]+> apx_nci_ndd_nf:
#...
[ 	]*[0-9]+[ 	]+> +\.arch \.apx_nci_ndd_nf
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} add %r16,%r17
[ 	]*[0-9]+[ 	]+01C1
[ 	]*[0-9]+[ 	]+\?+ 62ECEC10[ 	]+> +add %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+01C1
[ 	]*[0-9]+[ 	]+\?+ 62ECFC0C[ 	]+> +\{nf\} add %r16,%r17
[ 	]*[0-9]+[ 	]+01C1
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+> +adox %r16,%r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+\?+ 62ECEE10[ 	]+> +adox %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+> +andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+\?+ 62EAF404[ 	]+> +\{nf\} andn %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+F2D0
[ 	]*[0-9]+[ 	]+\?+ 62EC8404[ 	]+> +ccmpz %r16,%r17
[ 	]*[0-9]+[ 	]+39C1
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{load\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62ECFC0C[ 	]+> +\{store\} cfcmovz %r16,%r17
[ 	]*[0-9]+[ 	]+44C1
[ 	]*[0-9]+[ 	]+\?+ 62ECEC14[ 	]+> +cfcmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62ECEC10[ 	]+> +cmovz %r16,%r17,%r18
[ 	]*[0-9]+[ 	]+44C8
[ 	]*[0-9]+[ 	]+\?+ 62EC840A[ 	]+> +\{evex\} cmp %r16,%r17
[ 	]*[0-9]+[ 	]+39C1
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} lzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+F5C8
[ 	]*[0-9]+[ 	]+\?+ 62ECFC0C[ 	]+> +\{nf\} popcnt %r16,%r17
[ 	]*[0-9]+[ 	]+88C8
[ 	]*[0-9]+[ 	]+\?+ 62ECFC08[ 	]+> +\{evex\} tzcnt %r16,%r17
[ 	]*[0-9]+[ 	]+F4C8
[ 	]*[0-9]+[ 	]+> *
[ 	]*[0-9]+[ 	]+
[ 	]*[0-9]+[ 	]+\.arch default
[ 	]*[0-9]+[ 	]+\.arch \.noapx_nci_ndd_nf
[ 	]*[0-9]+[ 	]+\?+ D55801C1[ 	]+add[ 	]+%r16, %r17
[ 	]*[0-9]+[ 	]+\?+ 62ECFE08[ 	]+adox[ 	]+%r16, %r17
[ 	]*[0-9]+[ 	]+66C8
[ 	]*[0-9]+[ 	]+\?+ 62EAF400[ 	]+andn[ 	]+%r16, %r17, %r18
[ 	]*[0-9]+[ 	]+F2D0
#pass
