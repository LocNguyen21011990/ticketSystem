$(function () {
    'use strict';


    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();

    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
        {redirect:window.location.href.replace(/\/[^\/]*$/,'/cors/result.html?%s'),
        	singleFileUploads: true,
        	limitConcurrentUploads: 3,
        	maxNumberOfFiles:10,
        	maxFileSize:20000000,
        	resizeSourceFileTypes: /^image\/(gif|jpeg|png|jpg)$/,
      		resizeSourceMaxFileSize: 20000000, // 20MB
          uploadTemplate: function (o) {
            var rows = $();
            $.each(o.files, function (index, file) {
                var row = $('<tr class="template-upload fade">' +
                    '<td class="preview"><span class="fade"></span></td>' +
                    '<td class="name"></td>' +
                    '<td class="size"></td>' +
                    (file.error ? '<td class="error" colspan="2"></td>' :
                            '<td><div class="progress progress-success progress-striped active">' +
                                '<div class="bar" style="width:0%;"></div></div></td>' +
                                '<td class="start"><button class="btn btn-primary">' +
                                '<i class="icon-upload icon-white"></i>' +
                                '<span>Start</span>' +
                            '</button></td>'
                    ) + '<td class="cancel"><button class="btn btn-warning">' +
	                    '<i class="icon-ban-circle icon-white"></i>' +
	                    '<span>Cancel</span>' +
	                '</button></td></tr>');
                row.find('.name').text(file.name);
                row.find('.size').text(o.formatFileSize(file.size));
                if (file.error) {
                    row.find('.error').text(
                        locale.fileupload.errors[file.error] || file.error
                    );
                }
                rows = rows.add(row);
            });
            return rows;
          },
        downloadTemplate: function (o) {
          var rows = $();
          $.each(o.files, function (index, file) {
              var row = $('<tr class="template-download fade">' +
                  (file.error ? '<td></td><td class="name"></td>' +
                      '<td class="size"></td><td class="error" colspan="2"></td>' :
                          '<td class="preview"></td>' +
                              '<td class="name"><a></a></td>' +
                              '<td class="size"></td><td colspan="2"></td>'
                  ) + '<td class="delete"><button class="btn btn-danger"><i class="icon-trash icon-white"></i><span >Delete</span></button>' +
                      '<input type="checkbox" name="delete" value="1"></td></tr>');
              row.find('.size').text(o.formatFileSize(file.size));
              if (file.error) {
                  row.find('.name').text(file.name);
                  row.find('.error').text(
                      locale.fileupload.errors[file.error] || file.error
                  );
              } else {
                  row.find('.name a').text(file.name);
                  if (file.thumbnail_url) {
                
                      row.find('.preview').append('<a><img></a>')
                          .find('img').prop('src', file.thumbnail_url);
                      row.find('a').prop('rel', 'gallery');
                  }
                  row.find('a').prop('href', file.url);

              }
              rows = rows.add(row);
          });
          return rows;
      },

      submit: function (e, data) {


      	var vWidth,vHeight;

				vWidth=1024;
				vHeight=768;

      	var resizeSettings = [
                {resizeMaxWidth: vWidth,resizeMaxHeight: vHeight}
            ],
            $this = $(this),
            originalFile = data.files[0],
            filestoSubmit = [],
            deferred = $.Deferred(),
            promise = deferred.promise();
        $.each(resizeSettings, function (index, settings) {
            promise = promise.pipe(function () {
                filestoSubmit.push(data.files[0]);
                data.files = [originalFile];
                $.extend(data, settings);
                return $this.fileupload('resize', data);
            });
        });
        deferred.resolve();
        promise.done(function () {
            filestoSubmit.push(data.files[0]);
            data.files = filestoSubmit;
            $this.fileupload('send', data);
        });
        return false;



      }

     }
   );

});



