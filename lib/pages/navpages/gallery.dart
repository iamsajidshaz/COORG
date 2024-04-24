import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COORG GALLERY"),
        leading: Icon(CupertinoIcons.photo_on_rectangle),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          // image 1
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/raja_seat.jpg?alt=media&token=f635e7ec-4d00-4a0d-b8b9-894accbc511e',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 2
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/koteabby.jpg?alt=media&token=7a0a70be-91c1-4307-8967-63bbfada2877',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 3
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/coffeebean.jpg?alt=media&token=032b40c4-b140-4450-9a87-23310be16693',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          //
          // image 1
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/raja_seat.jpg?alt=media&token=f635e7ec-4d00-4a0d-b8b9-894accbc511e',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 2
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/koteabby.jpg?alt=media&token=7a0a70be-91c1-4307-8967-63bbfada2877',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 3
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/coffeebean.jpg?alt=media&token=032b40c4-b140-4450-9a87-23310be16693',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          //
          // image 1
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/raja_seat.jpg?alt=media&token=f635e7ec-4d00-4a0d-b8b9-894accbc511e',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 2
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/koteabby.jpg?alt=media&token=7a0a70be-91c1-4307-8967-63bbfada2877',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // image 3
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/kurycx-83189.appspot.com/o/coffeebean.jpg?alt=media&token=032b40c4-b140-4450-9a87-23310be16693',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          //
        ],
      ),
    );
  }
}
