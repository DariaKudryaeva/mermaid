import type { Pie } from 'mermaid-parser';
import { parse } from 'mermaid-parser';

import { log } from '../../logger.js';
import type { ParserDefinition } from '../../diagram-api/types.js';
import { populateCommonDb } from '../common/populateCommonDb.js';
import type { PieDB } from './pieTypes.js';
import { db } from './pieDb.js';
import { PieSection } from 'mermaid-parser/src/index.js';

function populateDb(ast: Pie, db: PieDB) {
  populateCommonDb(ast, db);
  db.setShowData(ast.showData);
  ast.sections.map((section: PieSection) => {
    db.addSection(section.label, section.value);
  });
}

export const parser: ParserDefinition = {
  parse: (input: string): void => {
    const ast: Pie = parse('pie', input);
    log.debug(ast);
    populateDb(ast, db);
  },
};
