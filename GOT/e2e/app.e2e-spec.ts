import { GOTPage } from './app.po';

describe('got App', () => {
  let page: GOTPage;

  beforeEach(() => {
    page = new GOTPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
