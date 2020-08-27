import UIKit
/*
 You can download and share a file
 */

extension UIViewController : URLSessionDownloadDelegate {
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        // create destination URL with the original pdf name
        guard let url = downloadTask.originalRequest?.url else { return }
        let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let fileName = String((url.lastPathComponent)) as NSString
        let destinationURL = documentsPath.appendingPathComponent("\(fileName).pdf")
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            do {
                //Show UIActivityViewController to save the downloaded file
                let contents  = try FileManager.default.contentsOfDirectory(at: documentsPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                for indexx in 0..<contents.count {
                    if contents[indexx].lastPathComponent == destinationURL.lastPathComponent {
                        let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                        
                        DispatchQueue.main.async {
                            self.present(activityViewController, animated: true, completion: nil)
                        }
                        
                    }
                }
            }
            catch (let err) {
                print("error: \(err)")
                
            }
        } catch (let writeError) {
            print(writeError)
        }
        
        
    }
}

extension UIViewController {
    
    public func downloadPDF(url : URL) {
         let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
         let downloadTask = urlSession.downloadTask(with: url)
         downloadTask.resume()
         
     }
    
}
