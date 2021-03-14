Load "guilib.ring"

MyApp = New qApp {

        win1 = new qWidget() {

                setwindowtitle("Binary Clock")
                setGeometry(100,100,200,150)
		
		frmHour8x = createBit(win1)
		frmHour4x = createBit(win1)
		frmHour2x = createBit(win1)
		frmHour1x = createBit(win1)
		frmHourx8 = createBit(win1)
		frmHourx4 = createBit(win1)
		frmHourx2 = createBit(win1)
		frmHourx1 = createBit(win1)

		frmMinute8x = createBit(win1)
		frmMinute4x = createBit(win1)
		frmMinute2x = createBit(win1)
		frmMinute1x = createBit(win1)
		frmMinutex8 = createBit(win1)
		frmMinutex4 = createBit(win1)
		frmMinutex2 = createBit(win1)
		frmMinutex1 = createBit(win1)

		frmSecond8x = createBit(win1)
		frmSecond4x = createBit(win1)
		frmSecond2x = createBit(win1)
		frmSecond1x = createBit(win1)
		frmSecondx8 = createBit(win1)
		frmSecondx4 = createBit(win1)
		frmSecondx2 = createBit(win1)
		frmSecondx1 = createBit(win1)

		hourX_ = new qVBoxLayout() {
			addwidget(frmHour8x)
			addwidget(frmHour4x)
			addwidget(frmHour2x)
			addwidget(frmHour1x)
		}

		hour_X = new qVBoxLayout() {
			addwidget(frmHourx8)
			addwidget(frmHourx4)
			addwidget(frmHourx2)
			addwidget(frmHourx1)
		}

		minute_X = new qVBoxLayout() {
			addwidget(frmMinutex8)
			addwidget(frmMinutex4)
			addwidget(frmMinutex2)
			addwidget(frmMinutex1)
		}
                minuteX_ = new qVBoxLayout() {
			addwidget(frmMinute8x)
			addwidget(frmMinute4x)
			addwidget(frmMinute2x)
			addwidget(frmMinute1x)
		}

		second_X = new qVBoxLayout() {
			addwidget(frmSecondx8)
			addwidget(frmSecondx4)
			addwidget(frmSecondx2)
			addwidget(frmSecondx1)
		}
                secondX_ = new qVBoxLayout() {
			addwidget(frmSecond8x)
			addwidget(frmSecond4x)
			addwidget(frmSecond2x)
			addwidget(frmSecond1x)
		}

                layout1 = new qHBoxLayout()
		layout1.addlayout(hourX_)
		layout1.addlayout(hour_X)
		layout1.addlayout(minuteX_)
		layout1.addlayout(minute_X)
		layout1.addlayout(SecondX_)
		layout1.addlayout(Second_X)

		new qtimer(win1) {
                        setinterval(1000)
                        settimeoutevent("PTime()")
                        start()
                }
		
                win1.setlayout(layout1)
                show()
        }

        exec()

}

Func BitUnpacker(num) {
	4thdig = false
	3rddig = false
	2nddig = false
	1stdig = false
	if num = 0
		return [false, false , false, false]
	end
	rem = num

	if (rem - 8) >= 0
		4thdig = true
		rem -= 8
	end
	if rem = 0
		return [1stdig, 2nddig, 3rddig, 4thdig]
	end
	
	if (rem - 4) >= 0
		3rddig = true
		rem -= 4
	end
	if rem = 0
		return [1stdig, 2nddig, 3rddig, 4thdig]
	end

	if (rem - 2) >= 0
		2nddig = true
		rem -= 2
	end
	if rem = 0
		return [1stdig, 2nddig, 3rddig, 4thdig]
	end	

	if (rem - 1) >= 0
		1stdig = true
		rem -= 1
	end

	return [1stdig, 2nddig, 3rddig, 4thdig]
}

Func PTime {
	tlist = TimeList()

	hours = Number(tlist[7])
	minutes = Number(tlist[11])
	seconds = Number(tlist[13])

	dealSeconds(seconds)
	dealMinutes(minutes)
	dealHours(hours)
}

Func dealSeconds(seconds) {
	unit = seconds % 10
	dec = floor(seconds / 10)

	bitSeconds_X = BitUnpacker(unit)
	if bitSeconds_X[1]
		bitOn(frmSecondx1)
	else
		bitOff(frmSecondx1)
	end

	if bitSeconds_X[2]
		bitOn(frmSecondx2)
	else
		bitOff(frmSecondx2)
	end

	if bitSeconds_X[3]
		bitOn(frmSecondx4)
	else
		bitOff(frmSecondx4)
	end

	if bitSeconds_X[4]
		bitOn(frmSecondx8)
	else
		bitOff(frmSecondx8)
	end

	// --------

	bitSecondsX_ = BitUnpacker(dec)
	if bitSecondsX_[1]
		bitOn(frmSecond1x)
	else
		bitOff(frmSecond1x)
	end

	if bitSecondsX_[2]
		bitOn(frmSecond2x)
	else
		bitOff(frmSecond2x)
	end

	if bitSecondsX_[3]
		bitOn(frmSecond4x)
	else
		bitOff(frmSecond4x)
	end

	if bitSecondsX_[4]
		bitOn(frmSecond8x)
	else
		bitOff(frmSecond8x)
	end
}

Func dealMinutes(minutes) {
	unit = minutes % 10
	dec = floor(minutes / 10)

	bitMinutes_X = BitUnpacker(unit)
	if bitMinutes_X[1]
		bitOn(frmMinutex1)
	else
		bitOff(frmMinutex1)
	end

	if bitMinutes_X[2]
		bitOn(frmMinutex2)
	else
		bitOff(frmMinutex2)
	end

	if bitMinutes_X[3]
		bitOn(frmMinutex4)
	else
		bitOff(frmMinutex4)
	end

	if bitMinutes_X[4]
		bitOn(frmMinutex8)
	else
		bitOff(frmMinutex8)
	end

	// --------

	bitMinutesX_ = BitUnpacker(dec)
	if bitMinutesX_[1]
		bitOn(frmMinute1x)
	else
		bitOff(frmMinute1x)
	end

	if bitMinutesX_[2]
		bitOn(frmMinute2x)
	else
		bitOff(frmMinute2x)
	end

	if bitMinutesX_[3]
		bitOn(frmMinute4x)
	else
		bitOff(frmMinute4x)
	end

	if bitMinutesX_[4]
		bitOn(frmMinute8x)
	else
		bitOff(frmMinute8x)
	end
}

Func dealHours(hours) {
	unit = hours % 10
	dec = floor(hours / 10)

	bitHours_X = BitUnpacker(unit)
	if bitHours_X[1]
		bitOn(frmHourx1)
	else
		bitOff(frmHourx1)
	end

	if bitHours_X[2]
		bitOn(frmHourx2)
	else
		bitOff(frmHourx2)
	end

	if bitHours_X[3]
		bitOn(frmHourx4)
	else
		bitOff(frmHourx4)
	end

	if bitHours_X[4]
		bitOn(frmHourx8)
	else
		bitOff(frmHourx8)
	end

	// --------

	bitHoursX_ = BitUnpacker(dec)
	if bitHoursX_[1]
		bitOn(frmHour1x)
	else
		bitOff(frmHour1x)
	end

	if bitHoursX_[2]
		bitOn(frmHour2x)
	else
		bitOff(frmHour2x)
	end

	if bitHoursX_[3]
		bitOn(frmHour4x)
	else
		bitOff(frmHour4x)
	end

	if bitHoursX_[4]
		bitOn(frmHour8x)
	else
		bitOff(frmHour8x)
	end
}

Func bitOff(bit) {
	bit.setstylesheet("border: 1px solid gray; background-color: darkgray;")
}

Func bitOn(bit) {
	bit.setstylesheet("border: 1px solid gray; background-color: blue;")
}

Func createBit(win) {
	return new qFrame(win, 2) {
		move(15, 15)
		resize(15,15)
		setstylesheet("border: 1px solid gray; background-color: darkgray; color: gray")
	}
}
