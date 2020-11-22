/*
 * 여행 플랫폼 관리자 alert.js
 * 작성자 : lje
 * 작성일자 : 2020.05
 * */
(function ($) {
    showSwal = function (type) {
        'use strict';
        if (type === 'basic') {
            Swal.fire({
                text: 'Any fool can use a computer',
                button: {
                    text: "OK",
                    value: true,
                    visible: true,
                    className: "btn btn-primary"
                }
            })

        } else if (type === 'title-and-text') {
            Swal.fire({
                title: 'Read the alert!',
                text: 'Click OK to close this alert',
                button: {
                    text: "OK",
                    value: true,
                    visible: true,
                    className: "btn btn-primary"
                }
            })

        } else if (type === 'success-message') {
            Swal.fire({
            	icon: 'success',
            	  title: 'Your work has been saved',
            	  showConfirmButton: false,
            	  timer: 1500
            })

        } else if (type === 'auto-close') {
            Swal.fire({
                title: 'Auto close alert!',
                text: 'I will close in 2 seconds.',
                timer: 2000,
                button: false
            }).then(
                function () {},
                // handling the promise rejection
                function (dismiss) {
                    if (dismiss === 'timer') {
                        console.log('I was closed by the timer')
                    }
                }
            )
        } else if (type === 'warning-message-and-cancel') {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2196f3',
                cancelButtonColor: '#ff6258',
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-danger'
                }

            }).then((result) => {
                if (result.value) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        icon: 'success',
                        confirmButtonColor: '#2196f3',
                        confirmButtonText: '확인',
                        customClass: {
                            confirmButton: 'btn btn-primary'
                        }
                    })
                }
            })

        } else if (type === 'custom-html') {
            Swal.fire({
            	title: 'Are you sure?',
            	text: '거절 사유를 입력해주세요.',
            	icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2196f3',
                cancelButtonColor: '#ff6258',
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-danger'
                },
	        	input: 'text',
	        	inputAttributes: {
	        	    autocapitalize: 'off',
	        	    class: 'form-control'
	        	}
                
            }).then((result) => {
                if (result.value) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        icon: 'success',
                        confirmButtonColor: '#2196f3',
                        confirmButtonText: '확인',
                        customClass: {
                            confirmButton: 'btn btn-primary'
                        }
                    })
                }
            })
        }
    }

})(jQuery);
$.fn.modal.Constructor.prototype._enforceFocus = function() {};