    // Less operands
    gic     cdaff
    gic     cdaff,
    gicr    x0
    gicr    x0,
    gsb

    // More operands
    gic     cdaff, x0, x1
    gicr    x0, cdia, x1
    gsb     ack, x0

    // Incorrect operands
    gic     x0
    gic     x0, cdaff
    gicr    cdia
    gicr    cdia, x0

    // Incorrect operation
    gic     cdwat, x0
    gicr    x0, cdwat
    gsb     awt
