import { AirlinePage } from './app.po';

describe('airline App', () => {
  let page: AirlinePage;

  beforeEach(() => {
    page = new AirlinePage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
