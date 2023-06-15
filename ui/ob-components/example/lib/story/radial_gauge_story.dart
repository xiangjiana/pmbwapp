import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story radialGaugeStory = Story(
  section: 'General',
  name: 'RadialGauge',
  builder: (BuildContext context, KnobsBuilder kb) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        /*  const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: RadialGauge(
              percent: 0,
              annotations: [
                Annotation(
                  angle: 270,
                  positionFactor: 1.2,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '暂无配置',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 130,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 50,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: RadialGauge(
              percent: 75,
              annotations: <Annotation>[
                Annotation(
                  angle: 270,
                  positionFactor: 1.2,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第1级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 130,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 50,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '100',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: RadialGauge(
              percent: 75,
              annotations: <Annotation>[
                Annotation(
                  angle: 130,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '5000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 50,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '50000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 270,
                  positionFactor: 1.2,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '20000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 340,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '30000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 200,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '10000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 165,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第5级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 235,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第6级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 305,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第7级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 15,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '第8级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
              gaps: <MarkerGap>[
                MarkerGap(25),
                MarkerGap(50),
                MarkerGap(75),
                MarkerGap(100),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: RadialGauge(
              percent: 100,
              annotations: <Annotation>[
                Annotation(
                  angle: 270,
                  positionFactor: 0.5,
                  child: const Text(
                    '爆表',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFF5722),
                    ),
                  ),
                ),
                Annotation(
                  angle: 130,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '5000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 50,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '50000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 270,
                  positionFactor: 1.2,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '20000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 340,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '30000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 200,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '10000',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Annotation(
                  angle: 165,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第5级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 235,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.far,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第6级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 305,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.far,
                  child: const Text(
                    '第7级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Annotation(
                  angle: 15,
                  positionFactor: 1.2,
                  horizontalAlignment: AnnotationAlignment.near,
                  verticalAlignment: AnnotationAlignment.near,
                  child: const Text(
                    '第8级',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
              gaps: <MarkerGap>[
                MarkerGap(25),
                MarkerGap(50),
                MarkerGap(75),
                MarkerGap(100),
              ],
            ),
          ),*/
        ],
      ),
    );
  },
);
