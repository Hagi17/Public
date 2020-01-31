$(document).ready(function() {
	$.getJSON("https://hagi17.github.io/Public/res/tourenfotos/fotos.json", function(data) {
		console.log(data);
		createAlbum(data.images);
	}).fail(function(err) {
		console.log(err);
	});
	
	function createAlbum(images)
	{
		var album = jQuery("figure.gesamt");
		images.forEach(function(img){
			var title = img.title;
			var linecnt = 0;
			var figcap = jQuery("<figcaption>", {text: img.title});
			if(title.indexOf("\n") > 0)
			{
				linecnt+=1;
				figcap.html(figcap.html().replace(/\n/g, '<br>'));
			}
			figcap.append(jQuery("<br>"));
			if(linecnt == 0)
			{
				figcap.append(jQuery("<br>"));
			}
			figcap.append(jQuery("<span>", {text: img.date, class: "date"}));
			var fig = jQuery("<figure>", {class: "einzel"}).append(
				jQuery("<img>", {src: img.path + ".jpg", alt: img.title})
			).append(figcap);
			album.append(fig);
		});
	}
});