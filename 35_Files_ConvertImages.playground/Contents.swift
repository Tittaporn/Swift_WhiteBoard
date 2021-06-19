import UIKit

//Challenge 35: Convert Images
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a path to a directory, then converts to PNGs any JPEGs it finds in there, leaving the originals intact. If any JPEG can’t be converted the function should just quietly continue.
 Tip #1: For the purpose of this task, just looking for “.jpg” and “.jpeg” file extensions is sufficient.
 Tip #2: You can write this for iOS or macOS depending on your skills. iOS is easy to code but tricky to create a test environment for, and macOS is the opposite. If you can solve this on both platforms, I’d rate this Taxing.
 Sample input and output
 • If your directory exists and is readable, all JPEGs in there should be converted to PNGs. • If any JPEGs can’t be read, converted, or written, just continue on quietly.
 Hints
 Hint #1: If you’re solving this on iOS, you will need to use UIImage(contentsOfFile:) and pngData().
 Hint #2: If you’re solving this on macOS, you will need to use NSImage and NSBitmapImageRep.
 Hint #3: Make sure and check the pathExtension property for each file.
 Hint #4: Calling write() on a Data instance throws an exception if things go wrong, but the challenge wants you to ignore it and carry on – a perfect use for try?, but make sure you silence the warning. */


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 How you solve this depends on the platform you choose: there are some similarities, but just as many differences.
 Let’s take a look at iOS first, because it’s the easiest option:
 1. Get an array of all files in the target directory.
 2. Loop over all files, ignoring any that don’t end with “jpeg” or “jpg”.
 3. Create a UIImage out of the file, then use its pngData() method to create PNG data for it. 4. Create a new filename by replacing “jpg” with “png” in the filename.
 5. Write the PNG data to disk using the new filename.
 Here it is in code:
 */
func challenge35(in directory: String) {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
    for file in files {
        guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { continue}
        guard let image = UIImage(contentsOfFile: file.path) else
        { continue }
        guard let png = image.pngData() else { continue }
        let newFilename = file.deletingPathExtension().appendingPathExtension("png")
        _ = try? png.write(to: newFilename) }
}

/*
 Accomplishing the same task on macOS is harder: steps 1, 2, 4, and 5 are the same, but step 3 is missing the convenience functions from iOS. Yes, you can create an NSImage in a similar way to a UIImage (macOS even has a URL-based initializer, which is a bonus!), but getting that image into PNG data is non-trivial.
 There are several approaches you could take, but there’s only one I consider even vaguely straightforward: get the TIFF representation of the image (this is a property on NSImage), create a bitmap representation from that, then convert that to a PNG for writing.
 Here’s the code:

func challenge35(in directory: String) {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
    for file in files {
        guard file.pathExtension == "jpeg" || file.pathExtension
                == "jpg" else { continue}
        guard let image = NSImage(contentsOf: file) else
        { continue }
        guard let tiffData = image.tiffRepresentation else
        { continue }
        guard let imageRep = NSBitmapImageRep(data: tiffData)
        else { continue }
        guard let png = imageRep.representation(using: .png,
                                                properties: [:]) else { continue }
        let newFilename = file.deletingPathExtension().appendingPathExtension("png")
        _ = try? png.write(to: newFilename) }
}

 Yes, that’s a lot of guard in one function, but it does help avoid a mess of optionality!
 */
