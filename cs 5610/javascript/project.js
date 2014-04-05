$(function () {
    project.init();
})

var project = {
    init: function () {
        project.home.init();
        project.results.init();
        project.tracks.init();
        project.searchResults.init();
        project.showPage("home");
    },

    showPage: function (pageName) {
        $(".page").hide();
        $(".page." + pageName).show();
    } 
}