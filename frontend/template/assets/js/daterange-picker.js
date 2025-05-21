jQuery(document).ready(function() {
    var start = moment().subtract(29, 'days');
    var end = moment();

    var daterange = document.querySelectorAll(".daterange-picker-custom");
    daterange.forEach(function (item) {
        $(item).daterangepicker({
            opens: 'left',
            minYear: 1930,
            maxYear: parseInt(moment().add(10, 'year').format('YYYY'),10),
            showDropdowns: true,
            // startDate: start,
            // endDate: end,
            locale: { cancelLabel: 'Huỷ',
                        applyLabel: 'Xác nhận',
                        daysOfWeek: [
                            "CN",
                            "T2",
                            "T3",
                            "T4",
                            "T5",
                            "T6",
                            "T7"
                        ],
                        monthNames: [
                            "Tháng 1",
                            "Tháng 2",
                            "Tháng 3",
                            "Tháng 4",
                            "Tháng 5",
                            "Tháng 6",
                            "Tháng 7",
                            "Tháng 8",
                            "Tháng 9",
                            "Tháng 10",
                            "Tháng 11",
                            "Tháng 12"
                        ],
                        format: "DD/MM/YYYY",
                        customRangeLabel: 'Tuỳ chỉnh'
                    },
            ranges: {
                    'Hôm nay': [moment(), moment()],
                    'Hôm qua': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '7 ngày vừa qua': [moment().subtract(6, 'days'), moment()],
                    '30 ngày vừa qua': [moment().subtract(29, 'days'), moment()],
                    'Tháng này': [moment().startOf('month'), moment().endOf('month')],
                    'Tháng trước': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
        });
        $(item).on('apply.daterangepicker', function(ev, picker) {
            $(this).children()[0].innerText = picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY')
        });
    });

    var input = document.querySelectorAll(".daterange-picker-custom span");
    input.forEach(function (item) {
        item.innerText = start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY')
    });
});
