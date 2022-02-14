package com.alexking.mrpresident

import java.io.File
import java.time.format.DateTimeFormatter
import java.time.LocalDate

class MrpresidentApplication {
	companion object {
		fun parseDate(s: String): LocalDate {
			try {
				try {
					try {
						return LocalDate.parse(s, DateTimeFormatter.ofPattern("MMM dd uuuu"))
					} catch (e: Exception) {
						return LocalDate.parse(s, DateTimeFormatter.ofPattern("MMM d uuuu"))
					}
				} catch (e: Exception) {
					try {
						return LocalDate.parse(s, DateTimeFormatter.ofPattern("MMMM dd uuuu"))
					} catch (e: Exception) {
						return LocalDate.parse(s, DateTimeFormatter.ofPattern("MMMM d uuuu"))
					}
				}
			} catch (e: Exception) {
				return LocalDate.now()
			}
    }

		fun parseFile(): List<MutableList<LocalDate>> {
			val lines = this::class.java.classLoader.getResource("data.txt").readText().split("\n")
			return lines.subList(1, lines.size - 2).map {
				val thisPresidentDates = mutableListOf<LocalDate>()
				var currentDate = this.parseDate(it.split(",")[1])
				while (!currentDate.isEqual(this.parseDate(it.split(",")[3]))) {
					thisPresidentDates.add(currentDate)
					currentDate = currentDate.plusDays(1)
				}
				thisPresidentDates
			}
		}

		@JvmStatic
		fun main(args: Array<String>) {
			var dates = this.parseFile()
			var currentDate = dates[0][0]
			var winningYear = currentDate.year
			var winningValue = 0
			while (!currentDate.isEqual(LocalDate.now())) {
				when (dates.filter { it.contains(currentDate) }.size > winningValue) {
					true -> {
						winningYear = currentDate.year
						winningValue = dates.filter { it.contains(currentDate) }.size
					}
					else -> {}
				}
				println(currentDate)
				currentDate = currentDate.plusDays(1)
			}
			println("The most presidents alive in the same year was when $winningValue were alive in $winningYear")
		}
	}
}
