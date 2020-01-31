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
		var year = 0;
		var years = [];
		images.forEach(function(img){
			var tmp = parseYear(img.path);
			if(tmp !== year)
			{
				album.append(jQuery("<a>",{name: tmp}));
				year = tmp;
				years.push(tmp);
			}
			var linecnt = 0;
			var figcap = jQuery("<figcaption>", {text: img.title});
			if(img.title.indexOf("\n") > 0)
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
		var time = jQuery("<span>", {class: "timechoice"});
		years.forEach(function(yr){
			time.append("<a>", {text: yr, href: "#" + yr});
		});
		time.insertBefore(album);
	}
	
	function parseYear(path)
	{
		return parseInt(path.substr(path.length - 4));
	}
});