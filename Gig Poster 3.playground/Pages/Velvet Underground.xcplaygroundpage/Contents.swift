//: # Gig Poster 3
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport

/*:
 Each image is exactly 400 pixels wide by 600 pixels tall.
 
 Your goal is to precisely reproduce this image:
 
 ![velvet-underground-no-grid](VelvetUnderground.png "Velvet Underground")
 ![velvet-underground-with-grid](VelvetUnderground-with-grid.png "Velvet Underground")
 
 By precisely reproducing this image, you will demonstrate your understanding of:
 
 * sequence (order of statements in a program)
 * conditionals (making decisions with ``if`` statements)
 * iteration (use of loops to repeat statements)
 
 You may use the color constants created below to obtain the correct colors.
 
 Remember that you can refer to the [Canvas class documentation](https://www.russellgordon.ca/canvasgraphics/documentation/classes/canvas), as needed.
 */

// Create a new canvas
let canvas = Canvas(width: 400, height: 600)

// COLORS
let black = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
let purple = Color(hue: 309, saturation: 78, brightness: 64, alpha: 100)
let offWhite = Color(hue: 83, saturation: 4, brightness: 89, alpha: 100)

// Begin your solution here...
//draw a black rectangle for the background
canvas.drawShapesWithBorders = false
canvas.fillColor = black
canvas.drawRectangle(at: Point(x: 0, y: 0), width: 400, height: 600)


//determine x value so it is not reset every time
var x = 0
for columns in 0...4 {
    //   determine x and y positions
    
    for column in 0...4 {
        let y = column * 80
        
        //get the different coloured arrows
        if columns == column {
            canvas.fillColor = offWhite
            canvas.lineColor = offWhite
        } else {
            canvas.fillColor = purple
            canvas.lineColor = purple
        }
        
        //draw arrows
        canvas.drawRectangle(at: Point(x: x, y: y), width: 64, height: 17)
        canvas.drawRectangle(at: Point(x: x, y: y), width: 17, height: 64)
        
        canvas.defaultLineWidth = 17
        canvas.drawLine(from: Point(x: x + 67, y: y + 67), to: Point(x: x + 20, y: y + 20))
        if column == 4 {
            x = x + 80
        
        }
        
    }
    
}

//print the velvet underground text
canvas.textColor = offWhite
canvas.drawText(message: "the velvet underground", at: Point(x: 10, y: 410), size: 34, kerning: -2)

//draw two white horizontal lines
//change line thickness
canvas.defaultLineWidth = 2
canvas.drawLine(from: Point(x: 0, y: 467), to: Point(x: 400, y: 467))
canvas.drawLine(from: Point(x: 0, y: 570), to: Point(x: 400, y: 570))

//draw three blocks of info
//x values
let block1x = 10
let block2x = 150
let block3x = 300

//y values
let row1y = 550
let row2y = 540

//size value
let size = 8

//first block
canvas.drawText(message: "first appearance in london", at: Point(x: block1x, y: row1y), size: size)
canvas.drawText(message: "the london college of printing", at: Point(x: block1x, y: row2y), size: size)

//second block
canvas.drawText(message: "with spring and pollyfloskin", at: Point(x: block2x, y: row1y), size: size)
canvas.drawText(message: "plus the great western light show", at: Point(x: block2x, y: row2y), size: size)

//third block
canvas.drawText(message: "thursday", at: Point(x: block3x, y: row1y), size: size)
canvas.drawText(message: "october 14 1971 / 8 pm", at: Point(x: block3x, y: row2y), size: size)

/*:
 ## Use Source Control
 
 Remember to commit and push your work before 12:05 PM on Wednesday, January 22, 2020, please.
 
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas

