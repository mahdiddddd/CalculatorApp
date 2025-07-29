package com.example.calculator

object CalculatorEngine {
    fun evaluate(expression: String): Double {
        return ExpressionParser(expression).parse()
    }
}

private class ExpressionParser(private val expr: String) {
    private var pos = -1
    private var ch = 0

    fun parse(): Double {
        nextChar()
        val x = parseExpression()
        if (pos < expr.length) throw RuntimeException("Unexpected: " + ch.toChar())
        return x
    }

    private fun nextChar() {
        ch = if (++pos < expr.length) expr[pos].code else -1
    }

    private fun eat(charToEat: Int): Boolean {
        while (ch == ' '.code) nextChar()
        if (ch == charToEat) {
            nextChar()
            return true
        }
        return false
    }

    private fun parseExpression(): Double {
        var x = parseTerm()
        while (true) {
            when {
                eat('+'.code) -> x += parseTerm()
                eat('-'.code) -> x -= parseTerm()
                else -> return x
            }
        }
    }

    private fun parseTerm(): Double {
        var x = parseFactor()
        while (true) {
            when {
                eat('*'.code) -> x *= parseFactor()
                eat('/'.code) -> x /= parseFactor()
                else -> return x
            }
        }
    }

    private fun parseFactor(): Double {
        if (eat('+'.code)) return parseFactor() // unary plus
        if (eat('-'.code)) return -parseFactor() // unary minus

        var x: Double
        val startPos = pos
        if (eat('('.code)) { // parentheses
            x = parseExpression()
            eat(')'.code)
        } else if (ch in '0'.code..'9'.code || ch == '.'.code) { // numbers
            while (ch in '0'.code..'9'.code || ch == '.'.code) nextChar()
            x = expr.substring(startPos, pos).toDouble()
        } else {
            throw RuntimeException("Unexpected: " + ch.toChar())
        }

        return x
    }
}