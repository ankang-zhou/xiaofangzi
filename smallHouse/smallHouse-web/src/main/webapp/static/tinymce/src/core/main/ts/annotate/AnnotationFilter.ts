/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 */

import { Option, Arr } from '@ephox/katamari';

import { AnnotationsRegistry, AnnotatorSettings } from './AnnotationsRegistry';
import * as Markings from './Markings';
import { Editor } from 'tinymce/core/api/Editor';

const setup = (editor: Editor, registry: AnnotationsRegistry): void => {
  const identifyParserNode = (span): Option<AnnotatorSettings> => {
    const optAnnotation = Option.from(span.attributes.map[Markings.dataAnnotation()]) as Option<string>;
    return optAnnotation.bind(registry.lookup);
  };

  editor.on('init', () => {
    editor.serializer.addNodeFilter('span', (spans) => {
      Arr.each(spans, (span) => {
        identifyParserNode(span).each((settings) => {
          if (settings.persistent === false) { span.unwrap(); }
        });
      });
    });
  });
};

export {
  setup
};
