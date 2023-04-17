import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


@cocotb.test()
async def test_kevinwguan(dut):
    dut._log.info("start")
    clock = Clock(dut.ext_clk, 80, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    dut.rst.value = 1
    await ClockCycles(dut.ext_clk, 10)
    dut.rst.value = 0

    #assert int(dut.segments.value) == segments[i]
